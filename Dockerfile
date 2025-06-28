FROM python:3.12-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt \
 || pip install --no-cache-dir -r requirements/base.txt

EXPOSE 8000

CMD ["gunicorn", "wger.wsgi:application", "--bind", "0.0.0.0:8000"] 