# zabbix-domain-expiration
Zabbix template and scripts for monitoring domain expiration dates

## Requirements
- Zabbix 7.0+
- `whois` package

## Installation

### 1. Install whois package

```bash
# Debian based
apt install whois -y

# RHEL based
dnf install whois -y
```

### 2. Copy external scripts

```bash
cp scripts/*.sh /usr/lib/zabbix/externalscripts/
chown zabbix. /usr/lib/zabbix/externalscripts/*.sh
chmod u+x /usr/lib/zabbix/externalscripts/*.sh
```

### 3. Copy agent configuration

For Zabbix Agent:
```bash
cp conf/*.conf /etc/zabbix/zabbix_agentd.d/
```

For Zabbix Agent 2:
```bash
cp conf/*.conf /etc/zabbix/zabbix_agent2.d/plugins.d/
```

### 4. Import template

Import template .yaml via Zabbix Web UI:
**Configuration → Templates → Import**

### 5. Add host

Add a new host (site name) in Zabbix and assign the **Domain Expiration** template.

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$DOMAIN.EXPIRE.CRIT}` | `30` | Days before expiration to trigger alert |