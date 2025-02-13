---@class util.icons
local M = {}

M.kinds = {
    Array = " ",
    Boolean = "󰨙 ",
    Class = " ",
    Codeium = "󰘦 ",
    Color = " ",
    Control = " ",
    Collapsed = " ",
    Constant = "󰏿 ",
    Constructor = " ",
    Copilot = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = "󰊕 ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = "󰊕 ",
    Module = " ",
    Namespace = "󰦮 ",
    Null = " ",
    Number = "󰎠 ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = "󱄽 ",
    String = " ",
    Struct = "󰆼 ",
    Supermaven = " ",
    TabNine = "󰏚 ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = "󰀫 ",
}

M.git = {
    Added = " ",
    Modified = " ",
    Removed = " ",
    LineAdded = "▎",
    LineChanged = "▎",
    LineDeleted = "",
    FileDeleted = " ",
    FileIgnored = "◌",
    FileRenamed = " ",
    FileStaged = "S",
    FileUnmerged = "",
    FileUnstaged = "",
    FileUntracked = "U",
    Diff = " ",
    Repo = " ",
    Octoface = " ",
    Copilot = " ",
    Branch = "",
}

M.diagnostics = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
}

M.filetypes = {
    octo = "",
}

M.ui = {
    ArrowCircleDown = "",
    ArrowCircleLeft = "",
    ArrowCircleRight = "",
    ArrowCircleUp = "",
    BoldArrowDown = "",
    BoldArrowLeft = "",
    BoldArrowRight = "",
    BoldArrowUp = "",
    BoldClose = "",
    BoldDividerLeft = "",
    BoldDividerRight = "",
    BoldLineLeft = "▎",
    BoldLineMiddle = "┃",
    BoldLineDashedMiddle = "┋",
    BookMark = "",
    BoxChecked = " ",
    Bug = " ",
    Clock = " ",
    Stacks = "",
    Scopes = "",
    Watches = "󰂥",
    DebugConsole = " ",
    Calendar = " ",
    Check = "",
    ChevronRight = "",
    ChevronShortDown = "",
    ChevronShortLeft = "",
    ChevronShortRight = "",
    ChevronShortUp = "",
    Circle = " ",
    CircleSmall = "●",
    Close = "󰅖",
    CloudDownload = " ",
    Code = "",
    Comment = "",
    Dashboard = "",
    DividerLeft = "",
    DividerRight = "",
    DoubleChevronRight = "»",
    Ellipsis = "",
    EmptyFolder = " ",
    EmptyFolderOpen = " ",
    Exit = " ",
    File = " ",
    FileFilled = " ",
    FileSymlink = "",
    Files = " ",
    FindFile = "󰈞",
    FindText = "󰊄",
    Fire = "",
    Folder = "󰉋 ",
    FolderOpen = " ",
    FolderSymlink = " ",
    Forward = " ",
    Gear = " ",
    History = " ",
    LazyVim = "󰒲 ",
    Lightbulb = " ",
    LineLeft = "▏",
    LineMiddle = "│",
    List = " ",
    ListOutline = " ",
    Lock = " ",
    NeoVim = " ",
    NewFile = " ",
    Note = " ",
    Package = " ",
    Pencil = "󰏫 ",
    Plugin = " ",
    Plus = " ",
    Project = " ",
    Reset = " ",
    Refresh = " ",
    Search = " ",
    SearchReverse = " ",
    SignIn = " ",
    SignOut = " ",
    Settings = " ",
    Tab = "󰌒 ",
    Table = " ",
    Target = "󰀘 ",
    Telescope = " ",
    Text = " ",
    Tree = "",
    Triangle = "󰐊",
    TriangleShortArrowDown = "",
    TriangleShortArrowLeft = "",
    TriangleShortArrowRight = "",
    TriangleShortArrowUp = "",
}

M.dap = {
    Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
    Breakpoint = " ",
    BreakpointCondition = " ",
    BreakpointRejected = { " ", "DiagnosticError" },
    LogPoint = ".>",
}

M.misc = {
    Dots = "󰇘",
    Thunder = "󰛕",
    Robot = "󰚩 ",
    Squirrel = " ",
    Tag = " ",
    Watch = "",
    Smiley = " ",
    Package = " ",
    CircuitBoard = " ",
}

return M
