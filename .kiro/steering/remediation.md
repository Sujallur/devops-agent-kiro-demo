# Remediation rules (demo)

- Fix only what the DevOps Agent root cause describes. Smallest possible change in `app/checkout.py`.
- Add or update a test in `tests/test_checkout.py` that reproduces the failure, and run `python3 -m pytest tests` before finishing.
- Do not touch `infra/`, `scripts/`, or `demo-private/`. Do not add dependencies or new files other than tests.
- Never run any AWS write command or deploy script. Show `git diff`, summarize in two sentences (root cause, fix), and stop. A human reviews, commits and deploys.
- Never print tokens or account IDs.
