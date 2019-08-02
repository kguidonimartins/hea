# Baixando última versão (latest release) de pacotes hospedados do github

```bash
curl -sL https://api.github.com/repos/USER/REPO/releases/latest \
| jq -r '.assets[].browser_download_url' \
| grep "*.deb" \
| wget -qi -
```

Fontes: https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8
