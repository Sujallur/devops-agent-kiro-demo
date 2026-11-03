import json
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "app"))
from checkout import handler  # noqa: E402


def test_total_without_coupon():
    event = {"items": [{"price": 10.0, "qty": 2}, {"price": 5.0, "qty": 1}]}
    body = json.loads(handler(event, None)["body"])
    assert body["total"] == 25.0
