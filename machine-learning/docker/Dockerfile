FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

COPY ml_app /app

RUN pip install uvicorn
RUN pip install fastapi
RUN pip install joblib
RUN pip install sklearn

CMD [ "python", "/app/app.py" ] 
