# C++ Project Template

Welcome to your C++ Project Template. This template adheres to the Google Style Guide and utilizes the Bazel framework.

## You need change template files

| File | Config |
| --- | --- |
| LICENSE | `<YEAR>` and `<COPYRIGHT HOLDER>` |
| main.cc | `<YEAR>` and `<COPYRIGHT HOLDER>` |
| release_version.yml | `<YEAR>` and `<COPYRIGHT HOLDER>` |
| .clang-format | `Language` default is `Cpp` |
| package.json | `name` default is `my-project` |
| .vscode/tasks.json | definition of how to compile |
| .bazelrc | configure compilation options in the `.bazelrc` file |
| release_version.yml | custom release workflow |

## You need install VSCode Extension

- C/C++
- clangd
- Bazel
- Clang-Format
- EditorConfig

## Project Directory Structure

> [!WARNING]
> Before importing any library, you must verify that it supports your project's current C++ standard to avoid introducing elusive, low-level bugs.

**External dependencies are typically managed via Bazel.**

```text
Project/
├── MODULE.bazel
├── ICENSE
├── src/                       # source code for internal implementation
│   └── encoding/              # example module directory
│       ├── BUILD
│       ├── base85.cc
│       ├── base85.h
│       └── base85_test.cc
├── include/                   # public headers and exported interfaces
└── third_party/               # local external libraries/dependencies
```

## How use this C/C++ project template

> [!TIP]
> This template uses pre-commit hooks for code linting and commit message validation. To ensure these hooks function correctly, Node.js and npm must be installed on your system, as they are required to run commitlint.

Windows **PowerShell** input:

```bash
E:                             # your local disk letter
cd E:\
gh repo create <MY-NEW-PROJECT> --template "x1nv/cpp-project-template" --public --clone
cd <MY-NEW-PROJECT>
npm install                    # for install Commitizen to Git commit
pre-commit install             # Google rule check and commitlint check
pre-commit install --hook-type commit-msg
code .                         # launch vscode
```

## Hot use Commitizen to Git commit

```bash
git add .
cz
```
