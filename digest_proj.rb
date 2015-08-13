require 'digest'
#10.Digest
class DigestProj
  puts Digest::SHA1.digest "password"
  puts Digest::SHA1.hexdigest "password"
  puts Digest::SHA1.base64digest "password"
  puts Digest::MD5.digest "password"
  puts Digest::MD5.hexdigest "password"
  puts Digest::MD5.base64digest "password"

  salt = Time.now.to_s
  puts salt
  salt = Time.now.to_i.to_s
  puts salt
end