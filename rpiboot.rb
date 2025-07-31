class Rpiboot < Formula
  desc "Raspberry Pi USB booting code"
  homepage "https://github.com/raspberrypi/usbboot"

  head do
    url "https://github.com/raspberrypi/usbboot.git"

    depends_on "libusb" => :build
    depends_on "pkg-config" => :build
  end

  def install
    system "make"
    bin.install "rpiboot"
  end

  test do
    assert_match "rpiboot", shell_output("#{bin}/rpiboot -help 2>&1", 255)
  end
end
