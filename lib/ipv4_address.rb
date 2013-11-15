require 'ipaddr'

class IPv4Address < IPAddr

  # by IANA
  RESERVED = ['128.0.0.0/16', '191.255.0.0/16', '192.0.0.0/24', '223.255.255.0/24']
  PRIVATE = ['10.0.0.0/8', '172.16.0.0/12', '192.168.0.0/16']
  LOOPBACK = ['127.0.0.0/8']
  LINK_LOCAL = ['169.254.0.0/16']
  DOCUMENTATION = ['192.0.2.0/24', '198.51.100.0/24', '203.0.113.0/24']
  IPV6_RELAY = ['192.88.99.0/24']
  BENCHMARK = ['198.18.0.0/15']
  MULTICAST = ['224.0.0.0/4']

  def reserved?
    exist_in_pool?(RESERVED)
  end

  def self.reserved?(addr)
    begin
      new(addr).reserved?
    rescue
      false
    end
  end

  def private?
    exist_in_pool?(PRIVATE)
  end

  def self.private?(addr)
    begin
      new(addr).private?
    rescue
      false
    end
  end

  def loopback?
    exist_in_pool?(LOOPBACK)
  end

  def self.loopback?(addr)
    begin
      new(addr).loopback?
    rescue
      false
    end
  end

  def link_local?
    exist_in_pool?(LINK_LOCAL)
  end

  def self.link_local?(addr)
    begin
      new(addr).link_local?
    rescue
      false
    end
  end

  def documentation?
    exist_in_pool?(DOCUMENTATION)
  end

  def self.documentation?(addr)
    begin
      new(addr).documentation?
    rescue
      false
    end
  end

  def ipv6_relay?
    exist_in_pool?(IPV6_RELAY)
  end

  def self.ipv6_relay?(addr)
    begin
      new(addr).ipv6_relay?
    rescue
      false
    end
  end

  def benchmark?
    exist_in_pool?(BENCHMARK)
  end

  def self.benchmark?(addr)
    begin
      new(addr).benchmark?
    rescue
      false
    end
  end

  def multicast?
    exist_in_pool?(MULTICAST)
  end

  def self.multicast?(addr)
    begin
      new(addr).multicast?
    rescue
      false
    end
  end

  def internet_routable?
    !reserved? &&
    !private? &&
    !loopback? &&
    !link_local? &&
    !documentation? &&
    !ipv6_relay? &&
    !benchmark? &&
    !multicast?
  end

  def self.internet_routable?(addr)
    is?(to_s) && new(addr).internet_routable?
  end

  def self.is?(addr)
    begin
      IPAddr.new(addr)
      true
    rescue
      false
    end
  end

  private

  def exist_in_pool?(collection)
    collection.collect do |address_scope|
      return true if IPAddr.new(address_scope).include?(self)
    end
    false
  end

end
