{{- $report := . -}}
{
  "rules": [
    {
      "id": "trivy-vulnerability",
      "name": "Vulnerability",
      "description": "Detected by Trivy",
      "engineId": "trivy",
      "cleanCodeAttribute": "VULNERABLE",
      "impacts": [
        {
          "softwareQuality": "SECURITY",
          "severity": "HIGH"
        }
      ]
    }
  ],
  "issues": [
    {{- range $index, $vulnerability := .Vulnerabilities }}
    {
      "ruleId": "trivy-vulnerability",
      "effortMinutes": 40,
      "primaryLocation": {
        "message": "{{ $vulnerability.Description }}",
        "filePath": "{{ $vulnerability.Target }}",
        "textRange": {
          "startLine": 1
        }
      }
    }{{ if lt (add $index 1) (len .Vulnerabilities) }},{{ end }}
    {{- end }}
  ]
}
