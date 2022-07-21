# Contributing guide

## Commit messages

Tool: https://commitizen-tools.github.io/commitizen/

### Format

- `feat`: New feature introduced with changes.
- `fix`: Bug fix.
- `chore`: Changes that don't relate to a fix/feature, and don't modify source/test files. Example: updating project dependencies.
- `docs`: Updates to documentation.
- `refactor`: Refactored code that neither fixes a bug or adds a feature.
- `style`: Changes that affect the formatting of the code, such as running linters white-spaces.
- `test`: Adding/updating tests.
- `ci`: Changes related to CI/CD.

Example:

```
fix: fix foo to enable bar

This fixes the broken behavior of the component by doing xyz.

BREAKING CHANGE
Before this fix foo wasn't enabled at all, behavior changes from <old> to <new>

Closes D2IQ-12345
```
