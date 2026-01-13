FROM python:3.12-slim

WORKDIR /app

COPY doc/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY doc ./doc
RUN sphinx-build -b html doc site

EXPOSE 8080

CMD ["python", "-m", "http.server", "8080", "--directory", "site"]
