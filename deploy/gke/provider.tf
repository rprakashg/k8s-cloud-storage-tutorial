provider "google-beta" {
    credentials = "${file(var.credential_file)}"
    project     = "${var.project_id}"
    region      = "${var.default_region}"
    zone        = "${var.default_zone}"
}
