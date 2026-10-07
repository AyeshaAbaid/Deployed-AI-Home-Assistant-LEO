FROM python:3.10-slim
WORKDIR /app
RUN pip install --no-cache-dir torch --extra-index-url https://download.pytorch.org/whl/cpu
COPY requirements-server.txt .
RUN pip install --no-cache-dir -r requirements-server.txt
COPY . .
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]