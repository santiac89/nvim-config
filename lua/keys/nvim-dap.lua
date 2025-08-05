return {
  {
    "<leader>db",
    function() require("dap").toggle_breakpoint() end,
    desc = "Toggle Breakpoint"
  },
  {
    "<leader>dc",
    function() require("dap").continue() end,
    desc = "Debug: Continue"
  },
  {
    "<leader>dC",
    function() require("dap").run_to_cursor() end,
    desc = "Debug: Run to Cursor"
  },
  {
    "<leader>dT",
    function() require("dap").terminate() end,
    desc = "Debug: Terminate"
  },
  {
    "<leader>dl",
    function() require("dap").list_breakpoints() end,
    desc = "Debug: List Breakpoints"
  },
  {
    "<leader>dx",
    function() require("dap").clear_breakpoints() end,
    desc = "Debug: Clear Breakpoints"
  },
  {
    "<leader>dr",
    function() require("dap").repl.open() end,
    desc = "Debug: Open REPL"
  },
  {
    "<leader>di",
    function() require("dap").step_into() end,
    desc = "Debug: Step Into"
  },
  {
    "<leader>do",
    function() require("dap").step_over() end,
    desc = "Debug: Step Over"
  },
}
