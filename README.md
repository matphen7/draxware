<div align="center">

```
██████╗ ██████╗  █████╗ ██╗  ██╗██╗    ██╗ █████╗ ██████╗ ███████╗
██╔══██╗██╔══██╗██╔══██╗╚██╗██╔╝██║    ██║██╔══██╗██╔══██╗██╔════╝
██║  ██║██████╔╝███████║ ╚███╔╝ ██║ █╗ ██║███████║██████╔╝█████╗  
██║  ██║██╔══██╗██╔══██║ ██╔██╗ ██║███╗██║██╔══██║██╔══██╗██╔══╝  
██████╔╝██║  ██║██║  ██║██╔╝ ██╗╚███╔███╔╝██║  ██║██║  ██║███████╗
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
```

**Kernel Module Injector for GhostLock TempRoot**

![Private](https://img.shields.io/badge/visibility-private-red)
![Encryption](https://img.shields.io/badge/encryption-AES--256--CBC-blue)
![Platform](https://img.shields.io/badge/platform-Android%20%7C%20Termux-green)
![Exploit](https://img.shields.io/badge/CVE-2026--43499-critical)

</div>

---

## Overview

DRAXWARE automates KernelSU module injection after a GhostLock (`CVE-2026-43499`) temporary root session.  
It installs Zygisk, Shamiko, and PlayIntegrityFix — then performs a soft Zygote restart without losing root.

## Requirements

- Android device vulnerable to CVE-2026-43499
- GhostLock exploit executed (uid=0 active)
- Termux installed
- `openssl`, `curl`, `ksud` available

## Usage

```bash
# After GhostLock exploit is active:
su
bash draxware.sh
```

## What it does

| Step | Action |
|------|--------|
| Preflight | Verify root + KernelSU daemon |
| Inject | Download & install ZygiskNext, Shamiko, PlayIntegrityFix |
| DenyList | Auto-configure financial apps (Dana, GoPay, OVO, etc.) |
| Soft Reboot | Restart Zygote — root stays active |

## Note

Script is AES-256-CBC encrypted. Source is private.  
On full reboot, re-run GhostLock then re-execute this script.  
Modules are cached — subsequent runs take under 10 seconds.

---

<div align="center">
<sub>by dr4xc0de — private use only</sub>
</div>
