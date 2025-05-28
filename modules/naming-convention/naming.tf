locals {
  azure_abbreviations = {
    # Allgemeine Azure-Ressourcen
    resource_group          = "rg"    # Ressourcengruppe
    automation_account      = "aa"    # Automatisierungskonto
    log_analytics_workspace = "law"   # Log Analytics-Arbeitsbereich
    diagnostic_categories   = "diagc" # Log Analytics-Arbeitsbereich
    managed_identity        = "id"    # Verwaltete Identität
    data_collection_rule    = "dcr"   # Datensammlungsregel

    # Netzwerkressourcen
    virtual_network                    = "vnet"   # Virtuelles Netzwerk
    virtual_network_peering            = "vnetp"  # Peering zwischen virtuellen Netzwerken
    subnet                             = "subnet" # Subnetz
    network_interface                  = "nic"    # Netzwerkinterface
    network_security_group             = "nsg"    # Netzwerksicherheitsgruppe
    route_table                        = "rt"     # Routentabelle
    local_network_gateway              = "lng"    # Lokales Netzwerk-Gateway
    virtual_network_gateway            = "vgw"    # Virtuelles Netzwerk-Gateway
    virtual_network_gateway_connection = "vgwc"   # Verbindung für Virtuelles Netzwerk-Gateway
    bastion_host                       = "bas"    # Azure Bastion
    dns_resolver                       = "dnsr"   # DNS-Resolver
    private_dns                        = "pdns"   # Private DNS-Zone
    private_dns_link                   = "pdnsl"  # Link für Private DNS

    # Speicherressourcen
    storage_account = "sa" # Speicherkonto
    managed_disk    = "md" # Verwaltete Festplatte

    # Compute-Ressourcen
    virtual_machine = "vm"  # Virtuelle Maschine
    public_ip       = "pip" # Öffentliche IP-Adresse

    # Sicherheitsressourcen
    firewall        = "fw"  # Firewall
    firewall_policy = "fwp" # Firewallrichtlinie
    key_vault       = "kv"  # Key Vault


    # Füge weitere Azure-Ressourcen-Abkürzungen hinzu
  }

  # Generiere Ressourcennamen für mehrere Anwendungen
  resource_names = {
    for app in var.applications :
    app => {
      for resource, abbreviation in local.azure_abbreviations :
      resource => join("-", compact([
        abbreviation,
        var.project,
        var.location,
        app,
        var.environment
      ]))
    }
  }

  storage_account_names = {
    for app in var.applications :
    app => lower(substr(join("", compact(["sa", var.project, var.location, app, var.environment])), 0, 24))
  }

  final_resource_names = {
    for app, resources in local.resource_names :
    app => merge(resources, { "storage_account" = local.storage_account_names[app] })
  }
}