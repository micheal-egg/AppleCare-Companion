# AppleCare Companion API

This is a Flask API simulating what internal Systems or API AppleCare has for device and warranty lookups.

## Endpoints

### GET /devices
Returns a list of registered Apple devices and their coverage status.

### GET /devices/<id>
Returns details for a single device.

### GET /devices/<id>/warranty
Returns a computed warranty summary:
- Active / Expired
- Coverage end date
- Estimated days remaining

## Run locally

```bash
cd backend-api
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python3 app.py
