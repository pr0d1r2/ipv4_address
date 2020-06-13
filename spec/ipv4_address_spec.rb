require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe IPv4Address do

  describe 'self.reserved?' do
    it 'should be true when is in reserved pool' do
      %w(
        128.0.0.1
        191.255.0.1
        192.0.0.1
        223.255.255.1
      ).each do |address|
        expect(IPv4Address.reserved?(address)).to be true
      end
    end

    it 'should be false when is not in reserved pool' do
      %w(
        74.125.127.83
        0.0.0.0
        10.0.0.1
        14.0.0.1
        127.0.0.1
        169.254.0.1
        172.16.0.1
        192.0.2.1
        192.88.99.1
        192.168.0.1
        198.18.0.1
        224.0.0.1
        240.0.0.1
        255.255.255.255
        256.0.0.0
        255.256.0.0
        255.255.256.0
        255.255.255.256
        999.999.999.999
        string
      ).each do |address|
        expect(IPv4Address.reserved?(address)).to be false
      end
    end
  end

  describe 'self.private?' do
    it 'should be true when address is in private pool' do
      %w(
        10.0.0.1
        172.16.0.1
        192.168.0.1
      ).each do |address|
        expect(IPv4Address.private?(address)).to be true
      end
    end

    it 'should be false when is not in private pool' do
      %w(
        74.125.127.83
        0.0.0.0
        14.0.0.1
        127.0.0.1
        128.0.0.1
        169.254.0.1
        191.255.0.1
        192.0.0.1
        192.0.2.1
        192.88.99.1
        198.18.0.1
        223.255.255.1
        224.0.0.1
        240.0.0.1
        255.255.255.255
        256.0.0.0
        255.256.0.0
        255.255.256.0
        255.255.255.256
        999.999.999.999
        string
      ).each do |address|
        expect(IPv4Address.private?(address)).to be false
      end
    end
  end

  describe 'self.loopback?' do
    it 'should be true when is not in loopback pool' do
      %w(
        127.0.0.1
      ).each do |address|
        expect(IPv4Address.loopback?(address)).to be true
      end
    end

    it 'should be false when is not in loopback pool' do
      %w(
        74.125.127.83
        0.0.0.0
        10.0.0.1
        14.0.0.1
        128.0.0.1
        169.254.0.1
        172.16.0.1
        191.255.0.1
        192.0.0.1
        192.0.2.1
        192.88.99.1
        192.168.0.1
        198.18.0.1
        223.255.255.1
        224.0.0.1
        240.0.0.1
        255.255.255.255
        256.0.0.0
        255.256.0.0
        255.255.256.0
        255.255.255.256
        999.999.999.999
        string
      ).each do |address|
        expect(IPv4Address.loopback?(address)).to be false
      end
    end
  end

  describe 'self.link_local?' do
    it 'should be true when is not in link_local pool' do
      %w(
        169.254.0.1
      ).each do |address|
        expect(IPv4Address.link_local?(address)).to be true
      end
    end

    it 'should be false when is not in link_local pool' do
      %w(
        74.125.127.83
        0.0.0.0
        10.0.0.1
        14.0.0.1
        127.0.0.1
        128.0.0.1
        172.16.0.1
        191.255.0.1
        192.0.0.1
        192.0.2.1
        192.88.99.1
        192.168.0.1
        198.18.0.1
        223.255.255.1
        224.0.0.1
        240.0.0.1
        255.255.255.255
        256.0.0.0
        255.256.0.0
        255.255.256.0
        255.255.255.256
        999.999.999.999
        string
      ).each do |address|
        expect(IPv4Address.link_local?(address)).to be false
      end
    end
  end


  describe 'self.documentation?' do
    it 'should be true when is not in documentation pool' do
      %w(
        192.0.2.1
        198.51.100.1
        203.0.113.1
      ).each do |address|
        expect(IPv4Address.documentation?(address)).to be true
      end
    end

    it 'should be false when is not in documentation pool' do
      %w(
        74.125.127.83
        0.0.0.0
        10.0.0.1
        14.0.0.1
        127.0.0.1
        128.0.0.1
        169.254.0.1
        172.16.0.1
        191.255.0.1
        192.0.0.1
        192.88.99.1
        192.168.0.1
        198.18.0.1
        223.255.255.1
        224.0.0.1
        240.0.0.1
        255.255.255.255
        256.0.0.0
        255.256.0.0
        255.255.256.0
        255.255.255.256
        999.999.999.999
        string
      ).each do |address|
        expect(IPv4Address.documentation?(address)).to be false
      end
    end
  end

  describe 'self.ipv6_relay?' do
    it 'should be true when is not in ipv6_relay pool' do
      %w(
        192.88.99.1
      ).each do |address|
        expect(IPv4Address.ipv6_relay?(address)).to be true
      end
    end

    it 'should be false when is not in ipv6_relay pool' do
      %w(
        74.125.127.83
        0.0.0.0
        10.0.0.1
        14.0.0.1
        127.0.0.1
        128.0.0.1
        169.254.0.1
        172.16.0.1
        191.255.0.1
        192.0.0.1
        192.0.2.1
        192.168.0.1
        198.18.0.1
        223.255.255.1
        224.0.0.1
        240.0.0.1
        255.255.255.255
        256.0.0.0
        255.256.0.0
        255.255.256.0
        255.255.255.256
        999.999.999.999
        string
      ).each do |address|
        expect(IPv4Address.ipv6_relay?(address)).to be false
      end
    end
  end

  describe 'self.benchmark?' do
    it 'should be true when is not in benchmark pool' do
      %w(
        198.18.0.1
      ).each do |address|
        expect(IPv4Address.benchmark?(address)).to be true
      end
    end

    it 'should be false when is not in benchmark pool' do
      %w(
        74.125.127.83
        0.0.0.0
        10.0.0.1
        14.0.0.1
        127.0.0.1
        128.0.0.1
        169.254.0.1
        172.16.0.1
        191.255.0.1
        192.0.0.1
        192.0.2.1
        192.88.99.1
        192.168.0.1
        223.255.255.1
        224.0.0.1
        240.0.0.1
        255.255.255.255
        256.0.0.0
        255.256.0.0
        255.255.256.0
        255.255.255.256
        999.999.999.999
        string
      ).each do |address|
        expect(IPv4Address.benchmark?(address)).to be false
      end
    end
  end

  describe 'self.multicast?' do
    it 'should be true when is not in multicast pool' do
      %w(
        224.0.0.1
      ).each do |address|
        expect(IPv4Address.multicast?(address)).to be true
      end
    end

    it 'should be false when is not in multicast pool' do
      %w(
        74.125.127.83
        0.0.0.0
        10.0.0.1
        14.0.0.1
        127.0.0.1
        128.0.0.1
        169.254.0.1
        172.16.0.1
        191.255.0.1
        192.0.0.1
        192.0.2.1
        192.88.99.1
        192.168.0.1
        198.18.0.1
        223.255.255.1
        240.0.0.1
        255.255.255.255
        256.0.0.0
        255.256.0.0
        255.255.256.0
        255.255.255.256
        999.999.999.999
        string
      ).each do |address|
        expect(IPv4Address.multicast?(address)).to be false
      end
    end
  end

  describe 'self.is?' do
    it 'should be true when is an ipv4 address' do
      %w(
        74.125.127.83
        0.0.0.0
        10.0.0.1
        14.0.0.1
        127.0.0.1
        128.0.0.1
        169.254.0.1
        172.16.0.1
        191.255.0.1
        192.0.0.1
        192.0.2.1
        192.88.99.1
        192.168.0.1
        198.18.0.1
        223.255.255.1
        224.0.0.1
        240.0.0.1
        255.255.255.255
      ).each do |address|
        expect(IPv4Address.is?(address)).to be true
      end
    end

    it 'should be false when is not an ipv4 address' do
      %w(
        256.0.0.0
        255.256.0.0
        255.255.256.0
        255.255.255.256
        999.999.999.999
        string
      ).each do |address|
        expect(IPv4Address.is?(address)).to be false
      end
    end
  end

  describe 'self.internet_routable?' do
    before(:each) do
      @ipv4_address = double(IPv4Address, :internet_routable? => false)
    end

    it 'should be true when given string is an ip address and it is internet routable' do
      expect(described_class).to receive(:is?).with('IPv4Address').and_return(true)
      expect(@ipv4_address).to receive(:internet_routable?).and_return(true)
      expect(described_class).to receive(:new).with(:addr).and_return(@ipv4_address)
      expect(IPv4Address.internet_routable?(:addr)).to be true
    end

    it 'should be false when string is an ip address but it is not internet routable' do
      expect(described_class).to receive(:is?).with('IPv4Address').and_return(true)
      expect(@ipv4_address).to receive(:internet_routable?).and_return(false)
      expect(described_class).to receive(:new).with(:addr).and_return(@ipv4_address)
      expect(IPv4Address.internet_routable?(:addr)).to be false
    end

    it 'should be false when' do
      expect(described_class).to receive(:is?).with('IPv4Address').and_return(false)
      expect(IPv4Address.internet_routable?(:addr)).to be false
    end
  end

  describe 'instance method' do
    before(:each) do
      @ipv4_address = IPv4Address.new
    end

    describe 'internet_routable?' do
      before(:each) do
        allow(@ipv4_address).to receive(:reserved?).and_return(false)
        allow(@ipv4_address).to receive(:private?).and_return(false)
        allow(@ipv4_address).to receive(:loopback?).and_return(false)
        allow(@ipv4_address).to receive(:link_local?).and_return(false)
        allow(@ipv4_address).to receive(:documentation?).and_return(false)
        allow(@ipv4_address).to receive(:ipv6_relay?).and_return(false)
        allow(@ipv4_address).to receive(:benchmark?).and_return(false)
        allow(@ipv4_address).to receive(:multicast?).and_return(false)
      end

      it 'should be true when address is not in any pools' do
        expect(@ipv4_address).to receive(:reserved?).and_return(false)
        expect(@ipv4_address).to receive(:private?).and_return(false)
        expect(@ipv4_address).to receive(:loopback?).and_return(false)
        expect(@ipv4_address).to receive(:link_local?).and_return(false)
        expect(@ipv4_address).to receive(:documentation?).and_return(false)
        expect(@ipv4_address).to receive(:ipv6_relay?).and_return(false)
        expect(@ipv4_address).to receive(:benchmark?).and_return(false)
        expect(@ipv4_address).to receive(:multicast?).and_return(false)
        expect(@ipv4_address.internet_routable?).to be true
      end

      it 'should be false when address is in reserved pool' do
        expect(@ipv4_address).to receive(:reserved?).and_return(true)
        expect(@ipv4_address.internet_routable?).to be false
      end

      it 'should be false when address is in  pool' do
        expect(@ipv4_address).to receive(:private?).and_return(true)
        expect(@ipv4_address.internet_routable?).to be false
      end

      it 'should be false when address is in loopback pool' do
        expect(@ipv4_address).to receive(:loopback?).and_return(true)
        expect(@ipv4_address.internet_routable?).to be false
      end

      it 'should be false when address is in link_local pool' do
        expect(@ipv4_address).to receive(:link_local?).and_return(true)
        expect(@ipv4_address.internet_routable?).to be false
      end

      it 'should be false when address is in documentation pool' do
        expect(@ipv4_address).to receive(:documentation?).and_return(true)
        expect(@ipv4_address.internet_routable?).to be false
      end

      it 'should be false when address is in ipv6_relay pool' do
        expect(@ipv4_address).to receive(:ipv6_relay?).and_return(true)
        expect(@ipv4_address.internet_routable?).to be false
      end

      it 'should be false when address is in benchmark pool' do
        expect(@ipv4_address).to receive(:benchmark?).and_return(true)
        expect(@ipv4_address.internet_routable?).to be false
      end

      it 'should be false when address is in multicast pool' do
        expect(@ipv4_address).to receive(:multicast?).and_return(true)
        expect(@ipv4_address.internet_routable?).to be false
      end
    end

    it 'reserved? should check_existance in proper pool' do
      expect(@ipv4_address).to receive(:exist_in_pool?).with(IPv4Address::RESERVED)
      @ipv4_address.reserved?
    end

    it 'private? should check_existance in proper pool' do
      expect(@ipv4_address).to receive(:exist_in_pool?).with(IPv4Address::PRIVATE)
      @ipv4_address.private?
    end

    it 'loopback? should check_existance in proper pool' do
      expect(@ipv4_address).to receive(:exist_in_pool?).with(IPv4Address::LOOPBACK)
      @ipv4_address.loopback?
    end

    it 'link_local? should check_existance in proper pool' do
      expect(@ipv4_address).to receive(:exist_in_pool?).with(IPv4Address::LINK_LOCAL)
      @ipv4_address.link_local?
    end

    it 'documentation? should check_existance in proper pool' do
      expect(@ipv4_address).to receive(:exist_in_pool?).with(IPv4Address::DOCUMENTATION)
      @ipv4_address.documentation?
    end

    it 'ipv6_relay? should check_existance in proper pool' do
      expect(@ipv4_address).to receive(:exist_in_pool?).with(IPv4Address::IPV6_RELAY)
      @ipv4_address.ipv6_relay?
    end

    it 'benchmark? should check_existance in proper pool' do
      expect(@ipv4_address).to receive(:exist_in_pool?).with(IPv4Address::BENCHMARK)
      @ipv4_address.benchmark?
    end

    it 'multicast? should check_existance in proper pool' do
      expect(@ipv4_address).to receive(:exist_in_pool?).with(IPv4Address::MULTICAST)
      @ipv4_address.multicast?
    end
  end

end
