FROM python
RUN pip install flask
COPY  ./static /home/myapp/static/
COPY  ./templates /home/myapp/templates/
EXPOSE 5050
CMD python /home/myapp/sample_app.py