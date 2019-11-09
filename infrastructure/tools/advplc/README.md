AUTOMATION FOR TASKS IN ADVPLC

Project for automation Apply packages\patchs Protheus

Getting Started

- Fork the project and enjoy.
- Atention for pre requisites and License!!!

Prerequisites

- Powershell 3.0 or latest
- Protheus Binaries LG
- Protheus RPO Build 12.1.23 or latest
- Includes(.ch) publish in folder includes/

Authors

- Marcos Silvestrini

License

- This project is licensed under the MIT License - see the LICENSE.md file for details

Stack of Project:

- appserver core LG
- powershell 3.0

Use advplc for apply patch,compile projects(.prw) and defrag RPO file in ERP Protheus

Oficial Doc and Credits:

- https://tdn.totvs.com/pages/viewpage.action?pageId=397381004

Install

- Clone repository of git:
  https://code.engpro.totvs.com.br/marcos.silvestrini/advplc-apply-patch.git

- Execute file install.bat

Apply Patch

- Copy your RPO to folder \apo\
- Copy your Package(.ptm,.upd or .pak) to folder \packages\
- Execute apply_patch.bat

Compile PRW

- Copy your RPO to folder \apo\
- Copy your Package(.prw) to folder \packages\
- Execute compile_prw.bat

Defrag RPO

- Copy your RPO to folder \apo\
- Execute defrag_rpo.bat
