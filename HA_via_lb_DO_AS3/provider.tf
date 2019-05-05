# Configure the Microsoft Azure Provider, replace Service Principal and Subscription with your own
provider "azurerm" {
    subscription_id = "${var.SP["c8bd4483-a1a2-47c4-acc8-4a49fbf180f3"]}"
    client_id       = "${var.SP["6a3ff318-e574-42b7-94ef-c81141ef5f5c"]}"
    client_secret   = "${var.SP["oinG0qT_z@BOymz4TP*?6IOUhf79T4.V"]}"
    tenant_id       = "${var.SP["e569f29e-b098-4cea-b6f0-48fa8532d64a"]}"
}

