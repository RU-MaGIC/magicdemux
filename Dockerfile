FROM centos:8 
LABEL authors="Alex Lemenze" \
      description="Docker image for BCL2FASTQ and cellranger"
      #Derived from hub.docker.com/r/ngsbioinformatics/cellranger/dockerfile

RUN yum install -y \
      wget \
      which \
      unzip

# BCL2FASTQ v2.2
RUN cd /tmp/ && \
    wget -O bcl2fastq-v2.20.0.422-Linux-x86_64.rpm "https://files.softwaredownloads.illumina.com/e8ed3335-5201-48ff-a2bc-db4bfb792c85/bcl2fastq2-v2-20-0-linux-x86-64.zip?Expires=1577330614&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9maWxlcy5zb2Z0d2FyZWRvd25sb2Fkcy5pbGx1bWluYS5jb20vZThlZDMzMzUtNTIwMS00OGZmLWEyYmMtZGI0YmZiNzkyYzg1L2JjbDJmYXN0cTItdjItMjAtMC1saW51eC14ODYtNjQuemlwIiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNTc3MzMwNjE0fX19XX0_&Signature=x7WmO88gFfgKEQJxaISDg-xKEID-C6jLnRaqpW6Q3d1EzmlCGpV3NGvM0kZ-DBLsAuTQUjro7AkhKl2olvsjswvUwqT2jkaHQk2TuKODKheeBbMJfuMr838u0fjykk7-xhH~jpLb1I1ysPOvFQ9gyRPwbMYOglY5As4ZlUg5gu90f-uI-SY~a9Ho-SlYeNqGYEBN7MQcyTjYC~SbSvcilEWbxB9iTR1PDe1ICyd5hlu130jKnczzpGloANbOa2oyRlSOFp-1o8qwNJ5NVTEmst6wSQEuuoV3RdYpRa3TmnzGsDAYJ8EslVWfxrkEcLHuXTMsO9ngy1sSXe~dfflqNQ__&Key-Pair-Id=APKAJO3UYWPXK4A26FPQ" && \
    yum install -y bcl2fastq2-v2.20.0.422-Linux-x86_64.rpm && \
    rm -f bcl2fastq2-v2-20-0-linux-x86-64.zip bcl2fastq2-v2.20.0.422-Linux-x86_64.rpm

# cellranger v3.1
RUN cd /opt/ && \
    wget -O cellranger-3.1.0.tar.gz "http://cf.10xgenomics.com/releases/cell-exp/cellranger-3.1.0.tar.gz?Expires=1577354569&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9jZWxsLWV4cC9jZWxscmFuZ2VyLTMuMS4wLnRhci5neiIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTU3NzM1NDU2OX19fV19&Signature=P-E1wehlHYwrsP43d9i9a15RGqx7dxLn-UM3VBYCBqGGz0B9mfi05geAlIDwRRxiJj6ZRZla8PDlwv2nfQe3rU6Jm9kOVa4I~VBQypDWqwd4lgH2DoY8x~N2M~QtbFZf~MaIU~Ykx7hZzaSqxs5HEdKy2rfdbu5smwjgS3LA2d5uPo0zgb2K3Y8iB-sgRYhoqYvZslZxUe9x8r2Vj7S-sWoYFuvf8OUNu2VOW1CHmmgOMq9JBnJPbIgT6X4zo2ObQKrgzZXixZncSKWSbxLdgguA65BySO0FT2~Qmb0RrTLduA4HHS08qrtTMDOlOlxwX5GncJdtaoF2ekoQWkdwFw__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" && \
    tar zxvf cellranger-3.1.0.tar.gz && \
    rm -f cellranger-3.1.0.tar.gz

#export the path
ENV PATH /opt/cellranger-3.1.0:$PATH
