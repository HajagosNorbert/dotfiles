local M = {
    "mfussenegger/nvim-dap",
    dependencies = {
        { "rcarriga/nvim-dap-ui" },
        { "theHamsta/nvim-dap-virtual-text" },
        { "nvim-telescope/telescope-dap.nvim" },
        { "LiadOz/nvim-dap-repl-highlights",  opts = {} },
    },

    config = function()
        require('nvim-dap-virtual-text').setup()

        local dap = require('dap')
        vim.g.dotnet_build_project = function()
            local default_path = vim.fn.getcwd() .. '/'
            if vim.g['dotnet_last_proj_path'] ~= nil then
                default_path = vim.g['dotnet_last_proj_path']
            end
            local path = vim.fn.input('Path to your *proj file', default_path, 'file')
            vim.g['dotnet_last_proj_path'] = path
            local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
            print('')
            print('Cmd to execute: ' .. cmd)
            local f = os.execute(cmd)
            if f == 0 then
                print('\nBuild: ✔️ ')
            else
                print('\nBuild: ❌ (code: ' .. f .. ')')
            end
        end

        vim.g.dotnet_get_dll_path = function()
            local request = function()
                return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
            end

            if vim.g['dotnet_last_dll_path'] == nil then
                vim.g['dotnet_last_dll_path'] = request()
            else
                if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
                    vim.g['dotnet_last_dll_path'] = request()
                end
            end

            return vim.g['dotnet_last_dll_path']
        end

        dap.adapters.coreclr = {
            type = 'executable',
            -- command = '/usr/local/bin/netcoredbg/netcoredbg',
            command = 'netcoredbg',
            args = { '--interpreter=vscode', '--engineLogging=/home/ez/.local/state/nvim/netcoredbg.log' }
        }


        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
                        vim.g.dotnet_build_project()
                    end
                    return vim.g.dotnet_get_dll_path()
                end,
            },
        }



        local dapui = require("dapui")
        local dapui_config = {
            icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
            mappings = {
                -- Use a table to apply multiple mappings
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
            },

            -- Expand lines larger than the window
            -- Requires >= 0.7
            expand_lines = vim.fn.has("nvim-0.7") == 1,
            layouts = {
                {
                    elements = {
                        -- Elements can be strings or table with id and size keys.
                        { id = "scopes", size = 0.25 },
                        "breakpoints",
                        "stacks",
                        "watches",
                    },
                    size = 40, -- 40 columns
                    position = "left",
                },
                {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 0.25, -- 25% of total lines
                    position = "bottom",
                },
            },
            controls = {
                -- Requires Neovim nightly (or 0.8 when released)
                enabled = true,
                -- Display controls in this element
                element = "repl",
                icons = {
                    pause = "",
                    play = "",
                    step_into = "",
                    step_over = "",
                    step_out = "",
                    step_back = "",
                    run_last = "↻",
                    terminate = "□",
                },
            },
            floating = {
                max_height = nil, -- These can be integers or a float between 0 and 1.
                max_width = nil, -- Floats will be treated as percentage of your screen.
                border = "single", -- Border style. Can be "single", "double" or "rounded"
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            windows = { indent = 1 },
            render = {
                max_type_length = nil, -- Can be integer or nil.
                max_value_lines = 100, -- Can be integer or nil.
            }
        }

        dapui.setup()


        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<F11>", dap.step_into)
        vim.keymap.set("n", "<F12>", dap.step_out)
        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
        vim.keymap.set("n", "<leader>lp",
            function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
        vim.keymap.set("n", "<leader>rd", dap.repl.open)
        vim.keymap.set("n", "<leader>ld", dap.run_last)
    end
}
return M
