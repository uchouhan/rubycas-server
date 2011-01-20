if Dir.getwd =~ /\/spec$/
  # Avoid potential weirdness by changing the working directory to the CASServer root
  FileUtils.cd('..')
end
