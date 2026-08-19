# ☁️ Terraform Azure Infrastructure 🚀

> **Infrastructure as Code (IaC) project using Terraform and Microsoft Azure**

This project provisions a complete basic Azure infrastructure using **Terraform**.
The infrastructure includes **Resource Groups, Virtual Network, Subnet, Public IP, Network Interface, and Linux Virtual Machine**.

---

## 🏗️ Architecture

```text
                         ☁️ Microsoft Azure
                                │
                                ▼
                     📦 Resource Group
                       rg-practice
                                │
                                ▼
                     🌐 Virtual Network
                       vnet-practice
                                │
                                ▼
                     🔗 Subnet
                    subnet_practice
                                │
                                ▼
                     🔌 Network Interface
                         niccard
                        │       │
                        │       └──────── 🌍 Public IP
                        │                    frontend
                        │
                        ▼
                  💻 Linux Virtual Machine
                         Linuxvm
```

---

## 📦 Azure Resources

| 🔧 Resource          | 📛 Name           | 📍 Location |
| -------------------- | ----------------- | ----------- |
| 📦 Resource Group    | `rg-practice`     | East US 2   |
| 📦 Resource Group    | `rg-practice2`    | East US 2   |
| 📦 Resource Group    | `rg-practice3`    | East US 2   |
| 🌐 Virtual Network   | `vnet-practice`   | East US 2   |
| 🔗 Subnet            | `subnet_practice` | East US 2   |
| 🌍 Public IP         | `frontend`        | East US 2   |
| 🔌 Network Interface | `niccard`         | East US 2   |
| 💻 Linux VM          | `Linuxvm`         | East US 2   |

---

# 📦 1. Resource Groups

Three Azure Resource Groups are configured in this project.

```hcl
rgs = {
  rg1 = {
    rg_name     = "rg-practice"
    rg_location = "east us 2"
  }

  rg2 = {
    rg_name     = "rg-practice2"
    rg_location = "east us 2"
  }

  rg3 = {
    rg_name     = "rg-practice3"
    rg_location = "east us 2"
  }
}
```

### 📋 Resource Groups

* 📦 `rg-practice`
* 📦 `rg-practice2`
* 📦 `rg-practice3`

📍 **Region:** East US 2

---

# 🌐 2. Virtual Network

A Virtual Network is created to provide networking for the Azure infrastructure.

```hcl
vnets = {
  vnet1 = {
    vnet_name     = "vnet-practice"
    vnet_location = "east us 2"
    rg_name       = "rg-practice"
    address_space = ["10.0.0.0/16"]
  }
}
```

### ⚙️ Configuration

* 🌐 **VNet Name:** `vnet-practice`
* 📦 **Resource Group:** `rg-practice`
* 📍 **Location:** East US 2
* 🔢 **Address Space:** `10.0.0.0/16`

---

# 🔗 3. Subnet

A subnet is created inside the Virtual Network.

```hcl
subnets = {
  subnet1 = {
    subnet_name      = "subnet_practice"
    rg_name          = "rg-practice"
    vnet_name        = "vnet-practice"
    address_prefixes = ["10.0.1.0/24"]
  }
}
```

### ⚙️ Configuration

* 🔗 **Subnet:** `subnet_practice`
* 🌐 **VNet:** `vnet-practice`
* 📦 **Resource Group:** `rg-practice`
* 🔢 **Address Prefix:** `10.0.1.0/24`

---

# 🌍 4. Public IP

A **Static Public IP** is created for external connectivity.

```hcl
public_ips = {
  public_ip1 = {
    public_ip_name    = "frontend"
    rg_name           = "rg-practice"
    pip_location      = "east us 2"
    allocation_method = "Static"
  }
}
```

### ⚙️ Configuration

* 🌍 **Public IP:** `frontend`
* 📦 **Resource Group:** `rg-practice`
* 📍 **Location:** East US 2
* 📌 **Allocation:** Static

---

# 🔌 5. Network Interface

The Network Interface connects the Virtual Machine to the Azure network.

```hcl
nics = {
  nic1 = {
    nic_name     = "niccard"
    nic_location = "east us 2"
    rg_name      = "rg-practice"
    subnet_name  = "subnet_practice"
    vnet_name    = "vnet-practice"
    pubip        = "frontend"
  }
}
```

### 🔗 Connections

```text
🔌 niccard
   │
   ├── 🔗 subnet_practice
   │
   └── 🌍 frontend
```

---

# 💻 6. Linux Virtual Machine

A Linux Virtual Machine is deployed and connected to the Network Interface.

```hcl
vms = {
  vm1 = {
    vm_name     = "Linuxvm"
    vm_location = "east us 2"
    rg_name     = "rg-practice"
    vm_size     = "Standard_D2s_v3"
    nic_name    = "niccard"
  }
}
```

### ⚙️ VM Configuration

* 💻 **VM Name:** `Linuxvm`
* 🐧 **OS:** Linux
* 📦 **Resource Group:** `rg-practice`
* 📍 **Location:** East US 2
* 💽 **VM Size:** `Standard_D2s_v3`
* 🔌 **NIC:** `niccard`

---

# 🗺️ Infrastructure Flow

```text
📦 Resource Group
       │
       ▼
🌐 Virtual Network
   vnet-practice
       │
       ▼
🔗 Subnet
subnet_practice
       │
       ▼
🔌 Network Interface
     niccard
      │   │
      │   └──────────► 🌍 Public IP
      │                 frontend
      │
      ▼
💻 Linux VM
   Linuxvm
```

---

# 📁 Project Structure

```text
📂 devopsarch
│
├── 📂 pre-prod
│   │
│   ├── 📂 azurem_NIC
│   ├── 📂 azurem_public_IP
│   ├── 📂 azurem_rg
│   ├── 📂 azurem_subnet
│   ├── 📂 azurem_vm
│   └── 📂 azurem_vnet
│
├── 📂 environment
│   └── 📂 prod
│       │
│       ├── 📄 main.tf
│       ├── 📄 provider.tf
│       ├── 📄 variable.tf
│       ├── 📄 terraform.tfvars
│       ├── 📄 terraform.tfstate
│       └── 📄 terraform.tfstate.backup
│
├── 📄 .gitignore
└── 📄 README.md
```

---

# 🛠️ Technologies Used

| 🧰 Technology      | 🎯 Purpose             |
| ------------------ | ---------------------- |
| 🏗️ Terraform      | Infrastructure as Code |
| ☁️ Microsoft Azure | Cloud Infrastructure   |
| 💻 Azure CLI       | Azure Management       |
| 🌿 Git             | Version Control        |
| 🐙 GitHub          | Code Repository        |

---

# 📋 Prerequisites

Before starting the project, install:

* 🏗️ Terraform
* ☁️ Azure CLI
* 🌿 Git
* ☁️ Active Azure Subscription

Check Terraform:

```bash
terraform version
```

Check Azure CLI:

```bash
az version
```

Check Git:

```bash
git --version
```

---

# 🔐 Azure Login

Login to Azure:

```bash
az login
```

Check the current subscription:

```bash
az account show
```

If you have multiple subscriptions:

```bash
az account set --subscription "<SUBSCRIPTION_ID>"
```

---

# 🚀 Terraform Deployment

Go to the Terraform environment directory:

```bash
cd environment/prod
```

### 1️⃣ Initialize Terraform

```bash
terraform init
```

### 2️⃣ Format Terraform Code

```bash
terraform fmt -recursive
```

### 3️⃣ Validate Configuration

```bash
terraform validate
```

### 4️⃣ Create Terraform Plan

```bash
terraform plan
```

### 5️⃣ Deploy Infrastructure

```bash
terraform apply
```

Confirm with:

```text
yes
```

🎉 Terraform will create the configured Azure infrastructure.

---

# 🔍 Verify Azure Resources

Check Resource Groups:

```bash
az group list --output table
```

Check Virtual Networks:

```bash
az network vnet list --output table
```

Check Subnets:

```bash
az network vnet subnet list \
  --resource-group rg-practice \
  --vnet-name vnet-practice \
  --output table
```

Check Public IPs:

```bash
az network public-ip list --output table
```

Check Network Interfaces:

```bash
az network nic list --output table
```

Check Virtual Machines:

```bash
az vm list --output table
```

---

# 🗑️ Destroy Infrastructure

When the infrastructure is no longer required:

```bash
terraform destroy
```

Confirm:

```text
yes
```

⚠️ **Warning:** `terraform destroy` will delete resources managed by the Terraform configuration.

---

# 🌿 Git Workflow

After making changes to Terraform files:

### 🔎 Check Status

```bash
git status
```

### ➕ Add Changes

```bash
git add .
```

### 💾 Commit Changes

```bash
git commit -m "Update Azure infrastructure"
```

### 🚀 Push Changes

```bash
git push
```

If your branch doesn't have an upstream:

```bash
git push -u origin feature1
```

---

# 🔄 Terraform Workflow

```text
📝 Write Terraform Code
          │
          ▼
🎨 terraform fmt
          │
          ▼
✅ terraform validate
          │
          ▼
📋 terraform plan
          │
          ▼
🚀 terraform apply
          │
          ▼
☁️ Azure Infrastructure
```

---

# ⚠️ Important Notes

🔐 **Security**

* Never commit passwords or secrets.
* Never commit Azure credentials.
* Never expose private SSH keys.

📦 **Terraform State**

Terraform state files can contain sensitive infrastructure information. Avoid committing:

```text
terraform.tfstate
terraform.tfstate.backup
```

Add them to `.gitignore`.

🏢 **Production**

For production environments, consider using **Azure Storage Account as a Terraform Remote Backend** for centralized and secure state management.

---

# 🎯 Project Objective

The main objective of this project is to understand and practice **Terraform Infrastructure as Code with Microsoft Azure**.

Through this project, you learn how to:

* 📦 Create Resource Groups
* 🌐 Create Virtual Networks
* 🔗 Create Subnets
* 🌍 Create Public IPs
* 🔌 Create Network Interfaces
* 💻 Deploy Linux Virtual Machines
* 🔗 Connect Azure networking components
* 🏗️ Manage infrastructure using Terraform
* 🌿 Manage Terraform code using Git
* 🚀 Deploy infrastructure using Infrastructure as Code

---

# 👨‍💻 DevOps Practice Project

### ☁️ Terraform + Azure + Git

```text
        👨‍💻
         │
         ▼
   📝 Terraform Code
         │
         ▼
     🌿 Git / GitHub
         │
         ▼
    🏗️ Terraform
         │
         ▼
    ☁️ Microsoft Azure
         │
         ▼
  🚀 Cloud Infrastructure
```

⭐ **Infrastructure as Code makes cloud infrastructure repeatable, version-controlled, and easier to manage.**

