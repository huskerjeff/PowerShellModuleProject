Install-Module -Name PSScriptAnalyzer -Force

describe 'Module-level tests' {

    it 'the module imports successfully' {
        { Import-Module (Resolve-Path('PowerShellModuleProject.psm1'))  } | should -Be -Not  8
    }

    it 'the module has an associated manifest' {
        Test-Path "$PSScriptRoot\PowerShellModuleProject.psd1" | should -Be $true
    }

    it 'passes all default PSScriptAnalyzer rules' {
        Invoke-ScriptAnalyzer -Path "$PSScriptRoot\PowerShellModuleProject.psm1" | should -BeNullOrEmpty
    }

}
