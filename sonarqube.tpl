{{- $report := . -}}
{
  "rules": [
    {{- range $index, $vulnerability := .Vulnerabilities }}
    {
      "id": "{{ $vulnerability.RuleID }}",
      "name": "{{ $vulnerability.Package }}_{{ $vulnerability.VulnerabilityID }}",
      "description": "{{ $vulnerability.Description }}",
      "engineId": "trivy",
      "cleanCodeAttribute": "VULNERABLE",
      "impacts": [
        {
          "softwareQuality": "SECURITY",
          "severity": "{{ $vulnerability.Severity | toUpper }}"
        }
      ]
    }{{ if lt (add $index 1) (len $report.Vulnerabilities) }},{{ end }}
    {{- end }}
  ],
  "issues": [
    {{- range $index, $vulnerability := .Vulnerabilities }}
    {
      "ruleId": "{{ $vulnerability.RuleID }}",
      "effortMinutes": 40,
      "primaryLocation": {
        "message": "{{ $vulnerability.Description }}",
        "filePath": "{{ $vulnerability.Target }}",
        "textRange": {
          "startLine": 1
        }
      }
    }{{ if lt (add $index 1) (len $report.Vulnerabilities) }},{{ end }}
    {{- end }}
  ]
}
