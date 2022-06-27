FROM apache/airflow:2.3.0-python3.8
RUN pip install apache-airflow[google]
RUN pip install apache-airflow-providers-google
RUN pip install scikit-learn
RUN pip install gcsfs
RUN pip install google-cloud-storage