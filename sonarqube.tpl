{{- $report := . -}}
{
  "rules": [
    {
      "id": "TRIVY_VULNERABILITY",
      "name": "Trivy Vulnerability",
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
      "ruleId": "TRIVY_VULNERABILITY",
      "effortMinutes": 40,
      "primaryLocation": {
        "message": "{{ $vulnerability.Description | js }}",
        "filePath": "{{ $vulnerability.Target | js }}",
        "textRange": {
          "startLine": 1
        }
      },
      "severity": "{{ $vulnerability.Severity }}"
    }{{ if lt (add $index 1) (len .Vulnerabilities) }},{{ end }}
    {{- end }}
  ]
}
