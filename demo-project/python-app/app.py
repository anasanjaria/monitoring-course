from flask import Flask, jsonify
import logging
from logstash_formatter import LogstashFormatterV1

app = Flask(__name__)

logger = logging.getLogger(__name__)
handler = logging.FileHandler('logs/app.log')
formatter = LogstashFormatterV1()
handler.setFormatter(formatter)
logger.addHandler(handler)
logger.setLevel(logging.INFO)

@app.route('/health')
def health():
    logger.info('Health endpoint hit')
    return jsonify({'message': 'Healthy'}), 200

@app.route('/fail')
def fail():
    try:
        1 / 0
    except ZeroDivisionError:
        logger.error('Failure endpoint hit', exc_info=True)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
