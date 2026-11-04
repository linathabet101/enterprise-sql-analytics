
# Development Environment Setup

## 1. Overview

This document describes how to install, configure, and verify the local PostgreSQL development environment required for the Enterprise SQL & Analytics Engineering project.

The instructions are written for Windows 10/11 (64-bit).

The objective is to provide a reproducible setup that allows another developer to install PostgreSQL, connect to the database, and execute SQL commands.

### 1.1 Verified Development Environment

The following configuration has been installed and tested successfully:

| Component | Configuration |
|---|---|
| Operating system | Windows 64-bit |
| Database engine | PostgreSQL |
| PostgreSQL version | 18.6 |
| Database administration | pgAdmin 4 |
| Command-line client | psql |
| Database name | enterprise_insurance |
| Database administrator | postgres |
| Host | localhost |
| Port | 5432 |
| Database encoding | UTF8 |
| Database locale | French_France.1252 |
| SQL development environment | Visual Studio Code |

**Important:** PostgreSQL 18.6 is the version verified during initial project setup. A later PostgreSQL 18.x release may be used when reproducing the environment, but the actual installed version should be recorded.

---

## 2. Prerequisites

Before beginning, ensure that the following are available:

- A Windows 10/11 64-bit computer.
- An internet connection.
- Administrator permissions for software installation and system environment configuration.
- Sufficient disk space for PostgreSQL and project files.

The following tools are used in this project:

| Tool | Purpose |
|---|---|
| PostgreSQL | Relational database management system |
| pgAdmin 4 | Graphical database administration |
| psql | PostgreSQL command-line client |
| Visual Studio Code | SQL development and documentation |
| Git | Version control |

---

## 3. Download PostgreSQL

1. Visit the official PostgreSQL website:

   https://www.postgresql.org/download/windows/

2. Select **Download the installer**.

3. The download page redirects to the EnterpriseDB (EDB) installer.

4. Select the appropriate PostgreSQL 18 installer for Windows x86-64.

5. Download the installer.

**Official download resources:**

- PostgreSQL: https://www.postgresql.org/
- Windows installer: https://www.postgresql.org/download/windows/

---

## 4. Install PostgreSQL

Run the downloaded installer.

Follow the installation wizard.

### 4.1 Installation Directory

Choose the installation directory.

The default installation directory used for this project is:

`C:\Program Files\PostgreSQL\18`

### 4.2 Select Components

The installation includes the PostgreSQL server, command-line tools and pgAdmin 4.

The components required for this project are:

- PostgreSQL Server
- pgAdmin 4
- Command Line Tools

### 4.3 Data Directory

Choose the directory where PostgreSQL will store its database files.

The installer provides a default location.

### 4.4 Set the Administrator Password

Create a password for the PostgreSQL administrative account:

`postgres`

This password is required when connecting to the database server.

**Security requirements:**

- Use a strong password.
- Store it securely.
- Never commit database passwords to Git.
- Never include credentials in screenshots or documentation.

### 4.5 Configure the Port

Use the default PostgreSQL port:

`5432`

This is the standard port used by PostgreSQL.

Only change it if another service is already using that port or if a different port is explicitly required.

### 4.6 Configure the Locale

Select:

`Default locale`

The installed database environment uses the Windows French locale:

`French_France.1252`

### 4.7 Complete the Installation

Review the installation settings and complete the wizard.

Stack Builder may open after installation.

Stack Builder is optional. It provides additional PostgreSQL extensions, drivers and utilities. No additional Stack Builder components are required for the initial stages of this project.

---

## 5. Verify the PostgreSQL Windows Service

Open Windows PowerShell.

Execute:

```powershell
Get-Service *postgres*
```

Expected result:

```text
Status   Name               DisplayName
------   ----               -----------
Running  postgresql-x64-18  postgresql-x64-18 - PostgreSQL Server
```

The PostgreSQL service must have the status:

`Running`

The service name may vary depending on the installed PostgreSQL version and configuration.

### Verified result

The installed service was identified as:

`postgresql-x64-18`

Its status was:

`Running`

---

## 6. Configure the PostgreSQL Command-Line Tools

The PostgreSQL command-line client is named:

`psql.exe`

Its default installation location is:

`C:\Program Files\PostgreSQL\18\bin\psql.exe`

### 6.1 Verify the Executable

Execute:

```powershell
Get-ChildItem "C:\Program Files\PostgreSQL\18\bin\psql.exe"
```

Expected result: PowerShell displays the `psql.exe` file.

### 6.2 Execute psql Using Its Full Path

Run:

```powershell
& "C:\Program Files\PostgreSQL\18\bin\psql.exe" --version
```

Verified output:

```text
psql (PostgreSQL) 18.6
```

### 6.3 Add PostgreSQL to Windows PATH

Adding PostgreSQL's `bin` directory to PATH allows PowerShell to recognize `psql` from any working directory.

Procedure:

1. Open Windows Search.
2. Search for `Environment Variables`.
3. Select **Edit the system environment variables**.
4. Click **Environment Variables**.
5. Under System variables, select `Path`.
6. Click **Edit**.
7. Click **New**.
8. Add:

   `C:\Program Files\PostgreSQL\18\bin`

9. Confirm the changes by clicking OK.

Close existing PowerShell windows and open a new one.

### 6.4 Verify PATH Configuration

Execute:

```powershell
psql --version
```

Verified output:

```text
psql (PostgreSQL) 18.6
```

If PowerShell reports that `psql` is not recognized, check that the correct PostgreSQL `bin` directory has been added to PATH and reopen the terminal.

---

## 7. Connect to PostgreSQL

Open PowerShell and execute:

```powershell
psql -U postgres -h localhost -p 5432
```

Command parameters:

| Parameter | Meaning |
|---|---|
| `psql` | Starts the PostgreSQL command-line client |
| `-U postgres` | Specifies the database user |
| `-h localhost` | Connects to the local computer |
| `-p 5432` | Specifies the PostgreSQL port |

Enter the password configured during installation.

The password will not be displayed while typing. This is normal behavior.

### 7.1 Successful Connection

A successful connection displays information similar to:

```text
psql (18.6)

Type "help" for help.

postgres=#
```

The prompt:

`postgres=#`

indicates that the current database is `postgres` and the connected user has administrative privileges.

### 7.2 Verify the Server Version

Execute:

```sql
SELECT version();
```

Verified result:

```text
PostgreSQL 18.6 on x86_64-windows,
compiled by msvc-19.44.35229, 64-bit
```

The exact output may vary depending on the PostgreSQL build.

### 7.3 Verify the Current Connection

Execute:

```sql
SELECT
    current_database() AS database_name,
    current_user AS connected_user,
    inet_server_port() AS server_port;
```

Expected values:

| database_name | connected_user | server_port |
|---|---|---|
| postgres | postgres | 5432 |

---

## 8. Create the Project Database

The project uses a dedicated database named:

`enterprise_insurance`

This database separates the project's objects and data from PostgreSQL's default administrative database.

### 8.1 Create the Database

While connected to PostgreSQL as the administrator, execute:

```sql
CREATE DATABASE enterprise_insurance;
```

Expected output:

```text
CREATE DATABASE
```

**Note:** PostgreSQL does not allow `CREATE DATABASE` inside a transaction block. Execute this command directly in the psql prompt.

If the database already exists, do not execute the creation command again. Connect to the existing database instead.

### 8.2 List Available Databases

Execute:

```sql
\l
```

Expected databases include:

| Database | Purpose |
|---|---|
| enterprise_insurance | Main project database |
| postgres | Default administrative database |
| template0 | Clean database template |
| template1 | Default database template |

### 8.3 Verify Database Encoding and Locale

Execute:

```sql
SELECT
    datname AS database_name,
    pg_encoding_to_char(encoding) AS encoding,
    datcollate AS collation,
    datctype AS character_type
FROM pg_database
WHERE datname = 'enterprise_insurance';
```

Verified configuration:

| Property | Value |
|---|---|
| Database | enterprise_insurance |
| Encoding | UTF8 |
| Collation | French_France.1252 |
| Character type | French_France.1252 |

---

## 9. Connect to the Project Database

From the `psql` prompt, execute:

```sql
\c enterprise_insurance
```

Expected output:

```text
You are now connected to database
"enterprise_insurance" as user "postgres".
```

The prompt changes to:

```text
enterprise_insurance=#
```

This confirms that subsequent SQL statements are executed against the project database.

### 9.1 Verify the Project Connection

Execute:

```sql
SELECT
    current_database() AS database_name,
    current_user AS connected_user,
    version() AS postgresql_version;
```

Verified result:

| Field | Value |
|---|---|
| database_name | enterprise_insurance |
| connected_user | postgres |
| PostgreSQL version | PostgreSQL 18.6 |

### 9.2 Exit psql

Execute:

```sql
\q
```

This closes the PostgreSQL command-line session.

---

## 10. Verify pgAdmin 4

pgAdmin 4 provides a graphical interface for managing PostgreSQL databases.

### 10.1 Open pgAdmin

1. Open Windows Search.
2. Search for `pgAdmin 4`.
3. Launch the application.

### 10.2 Connect to the PostgreSQL Server

1. Expand **Servers** in the Browser panel.
2. Select the PostgreSQL 18 server.
3. Enter the PostgreSQL password if prompted.

### 10.3 Locate the Project Database

Expand:

```text
Servers
└── PostgreSQL 18
    └── Databases
        └── enterprise_insurance
```

### Verified result

The `enterprise_insurance` database was successfully located under the PostgreSQL server in pgAdmin 4.

This confirms that pgAdmin can access the installed PostgreSQL server and display the project database.

---

## 11. Troubleshooting

### 11.1 Error: psql Is Not Recognized

Example:

```text
psql : Le terme «psql» n'est pas reconnu
```

**Cause:**

Windows cannot locate the PostgreSQL command-line executable through its PATH environment variable.

**Solution:**

1. Confirm that `psql.exe` exists.
2. Add the PostgreSQL `bin` directory to PATH.
3. Close and reopen PowerShell.
4. Execute:

```powershell
psql --version
```

Alternative: execute `psql.exe` using its full path.

### 11.2 PostgreSQL Service Is Not Running

Check the service:

```powershell
Get-Service *postgres*
```

If the service is stopped, open PowerShell as Administrator and start the relevant service:

```powershell
Start-Service postgresql-x64-18
```

Verify again:

```powershell
Get-Service postgresql-x64-18
```

### 11.3 Connection Refused

Example:

```text
connection to server at "localhost" failed
```

Possible causes:

- PostgreSQL service is stopped.
- Incorrect port.
- Incorrect host.
- Server configuration or network issue.

Check the service and confirm that the connection parameters are correct.

### 11.4 Password Authentication Failed

Example:

```text
FATAL: password authentication failed
```

Check that:

- The correct PostgreSQL username is being used.
- The password is correct.
- The server is the intended PostgreSQL installation.

Do not share database credentials when requesting technical assistance.

### 11.5 Console Encoding Warning

During the initial Windows connection, psql displayed:

```text
Attention : l'encodage console (437) diffère
de l'encodage Windows (1252).
```

This warning indicates that the terminal code page and Windows encoding are different.

It does not prevent a successful database connection.

The database itself uses UTF8 encoding. Terminal encoding can be configured separately if character display issues arise.

---

## 12. Security and Configuration Guidelines

The following rules apply throughout the project:

1. Never commit passwords or database credentials.
2. Do not store confidential or real customer information in the repository.
3. Use synthetic data for all demonstrations.
4. Keep database configuration separate from SQL transformation logic.
5. Document changes to the development environment.
6. Record actual software versions and execution results.
7. Validate database objects and transformations before considering them complete.

The PostgreSQL administrator account is used for initial local development setup. A separate application or development role with restricted permissions should be introduced when we implement database security and role management.

---

## 13. Initial Environment Verification Checklist

| Verification | Result |
|---|---|
| PostgreSQL installed | Verified |
| PostgreSQL 18.6 identified | Verified |
| Windows service running | Verified |
| psql executable located | Verified |
| Windows PATH configured | Verified |
| psql accessible from PowerShell | Verified |
| PostgreSQL connection successful | Verified |
| Server version queried | Verified |
| enterprise_insurance created | Verified |
| Database encoding UTF8 | Verified |
| Connection to project database successful | Verified |
| pgAdmin 4 installed | Verified |
| Database visible in pgAdmin | Verified |

---

## 14. Final Result

The local PostgreSQL development environment is operational.

The project database is:

`enterprise_insurance`

The initial database configuration has been verified using both the PostgreSQL command-line client and pgAdmin 4.

**Next development stage:** Configure the SQL development workflow in Visual Studio Code and establish the project's database schema architecture.
