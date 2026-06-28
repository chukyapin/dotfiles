return {
  settings = {
    python = {
      analysis = {
        diagnosticMode = "workspace",
        diagnosticSeverityOverrides = {
          reportUnusedImport = "none",
          reportUnusedVariable = "none",
          reportUnusedFunction = "none",
          reportUnusedClass = "none",
        },
      },
    },
  },
}
