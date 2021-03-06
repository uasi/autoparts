module Autoparts
  module Packages
    class Rust < Package
      name 'rust'
      version '0.8'
      description 'Rust: a safe, concurrent, practical language'
      source_url 'http://static.rust-lang.org/dist/rust-0.8.tar.gz'
      source_sha1 '4ba016ed09fa66c80974eea18a4c5036e2c10817'
      source_filetype 'tar.gz'
      binary_url 'https://nitrousio-autoparts-use1.s3.amazonaws.com/rust-0.8-binary.tar.gz'
      binary_sha1 'bf43b1923b12ccfb92a78e553481a09ad6e06849'

      def install
        Dir.chdir('rust-0.8') do
          execute 'make', 'install'
        end
      end

      def compile
        Dir.chdir('rust-0.8') do
          args = [
            "--prefix=#{prefix_path}"
          ]

          execute './configure', *args
          execute 'make'
        end
      end
    end
  end
end
