import requests
import json
auth_url = "https://login.microsoftonline.com/yourtenant.onmicrosoft.com/oauth2/v2.0/token"
auth_data = {
    'client_id': 'your_client_id',
    'scope': 'https://graph.microsoft.com/.default',
    'client_secret': 'your_secret',
    'grant_type': 'client_credentials'
}
auth_response = requests.post(auth_url, data=auth_data)
access_token = auth_response.json().get('access_token')
headers = {
    'Authorization': f'Bearer {access_token}',
    'Content-Type': 'application/json'
}
user_id = "user_object_id"
update_url = f"https://graph.microsoft.com/v1.0/users/{user_id}"
update_data = {
    "mail": "newemail@domain.com",
    "userPrincipalName": "newemail@domain.com"
}
requests.patch(update_url, headers=headers, data=json.dumps(update_data))