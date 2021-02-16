import json
import datetime

def lambda_handler(event, context):
    current_time = datetime.datetime.utcnow().isoformat()[0:19].replace('T')
    return {
        'statusCode': 200,
        'headers': {
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json'
        },
        'body': json.dumps()
    }