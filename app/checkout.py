"""Checkout service: totals an order. Baseline (healthy) version."""
import json


def handler(event, context):
    items = event.get("items", [])
    total = sum(i["price"] * i["qty"] for i in items)
    return {"statusCode": 200, "body": json.dumps({"total": round(total, 2)})}
