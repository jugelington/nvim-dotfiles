local configs = require'lspconfig/configs'
local util = require'lspconfig/util'
local server_name = 'FSharpLanguageServer'
local bin_name = 'FSharpLanguageServer.dll'

local function make_installer()
    local install_dir = util.path.join{util.base_install_dir, server_name}
    local pid = vim.fn.getpid()
    local bin_path = util.path.join{install_dir, 'fsharp-language-server-0.1.27/src/FSharpLanguageServer/bin/Release/netcoreapp3.0/', bin_name}

    local download_target = util.path.join{install_dir, "v0.1.27.zip"}
    local extract_cmd = string.format("unzip '%s' -d '%s'", download_target, install_dir)
    local download_cmd = string.format('curl -fLo "%s" --create-dirs "https://github.com/fsprojects/fsharp-language-server/archive/v0.1.27.zip"', download_target)
    local build_cmd = string.format("dotnet build %s/fsharp-language-server-0.1.27/ -c Release", install_dir)
    local make_executable_cmd = string.format("chmod u+x '%s'", bin_path)

    local X = {}
    function X.install()
        local install_info = X.info()
        if install_info.is_installed then
            print(server_name, "is already installed")
            return
        end
        if not (util.has_bins("curl")) then -- check for unzip, chmod as well
            error('Need "curl" to install this.')
            return
        end
            vim.fn.mkdir(install_dir, 'p')
            vim.fn.system(download_cmd)
            vim.fn.system(extract_cmd)
            vim.fn.system(build_cmd)
            vim.fn.system(make_executable_cmd)
        end
    function X.info()
        return {
          is_installed = util.path.exists(bin_path);
          install_dir = install_dir;
          cmd = { string.format('dotnet %s', bin_path) };
          root_dir = util.root_pattern('.fsproj', '.sln', '.git');
        }
    end
    function X.configure(config)
        local install_info = X.info()
        if install_info.is_installed then
            config.cmd = install_info.cmd
        end
    end
  return X
end

local installer = make_installer()

configs[server_name] = {
    default_config = {
        log_level = vim.lsp.protocol.MessageType.Log;
        root_dir = installer.info().root_dir;
        filetypes = { 'fs', 'fsx', 'fsi' };
        cmd = installer.info().cmd;
        settings = {};
        init_options = {};
        on_new_config = function(config)
            installer.configure(config)
        end;
    }
}

configs[server_name].install = installer.install
configs[server_name].install_info = installer.info
