from flask import Flask, jsonify

app = Flask(__name__)

# Temporary Date to use as AppleCare Records
devices = [
    {
        "id": "1",
        "name": "iPhone 15 Pro",
        "serialNumber": "AB12345",
        "purchaseDate": "2023-09-20",
        "coverageEndDate": "2025-09-20",
        "coverageStatus": "Active"
    },
    {
        "id": "2",
        "name": "MacBook Air M2",
        "serialNumber": "XY98765",
        "purchaseDate": "2022-08-15",
        "coverageEndDate": "2024-08-15",
        "coverageStatus": "Expired"
    }
]

@app.route("/devices", methods=["GET"])
def get_devices():
    """
    Return all registered devices.
    This matches what the SwiftUI app will show in the device list.
    """
    return jsonify(devices)

@app.route("/devices/<device_id>", methods=["GET"])
def get_device(device_id):
    """
    Return a single device by ID.
    """
    for d in devices:
        if d["id"] == device_id:
            return jsonify(d)
    return jsonify({"error": "Device not found"}), 404

@app.route("/devices/<device_id>/warranty", methods=["GET"])
def get_warranty(device_id):
    """
    Return a warranty summary for one device.
    """
    for d in devices:
        if d["id"] == device_id:
            # This calculates days remaining
            if d["coverageStatus"] == "Active":
                days_remaining = 120
            else:
                days_remaining = 0

            return jsonify({
                "deviceID": d["id"],
                "coverageStatus": d["coverageStatus"],
                "coverageEndDate": d["coverageEndDate"],
                "daysRemaining": days_remaining
            })

    return jsonify({"error": "Device not found"}), 404


if __name__ == "__main__":
    # debugging
    app.run(debug=True)
