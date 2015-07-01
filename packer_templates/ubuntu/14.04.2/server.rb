Racker::Processor.register_template do |image|
  image.builders["ubuntu-14.04.2-server-amd64"] = {
    "commit" => true,
    "image" => "ubuntu:14.04.2",
    "type" => "docker",
  }

  # Sequence definition to first tag, then push the image.
  image.postprocessors["docker-tag-and-push"] = [{
    "repository" => "tdg5/ubuntu-14.04.2-server-amd64",
    "tag" => "0.0.1",
    "type" =>"docker-tag",
  }, {
    "type" => "docker-push",
  }]
end
