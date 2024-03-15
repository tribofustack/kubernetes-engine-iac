<br><br>

<div align="center">

<h3>
    Google Cloud Platform + Infrastructure as Code
</h3>

<br>

<span>
<img width="150" src="https://user-images.githubusercontent.com/25181517/183911547-990692bc-8411-4878-99a0-43506cdb69cf.png" />
</span>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<span>
<img width="150" src="https://user-images.githubusercontent.com/25181517/183345121-36788a6e-5462-424a-be67-af1ebeda79a2.png" />
</span>
</div>

</div>


<br>

### This is a project to generate a Kubernetes Engine cluster in Google Cloud Platform. This works as a module made with Terraform to help all configuration.

<br>

## Requirements

- Google Cloud Platform account
- Create a project
- Create a Service Account - and get the credentials JSON

## Inputs

  - project_id
  - zone
  - region
  - cluster_name
  - machine_type
  - image_type
  - disk_size_gb
  - disk_type

## Outputs

  - cluster_info
    - cluster_ca_certificate
    - cluster_auth
    - cluster_endpoint
    - sensitive = true


<br>

<br> 

## 📝 License

This project is licensed under the MIT License. For more information, please refer to the [LICENSE](LICENSE.md) file.
