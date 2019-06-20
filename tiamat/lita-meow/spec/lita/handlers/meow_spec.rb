require "spec_helper"
require "pry"

describe Lita::Handlers::Meow, lita_handler: true do
  it { is_expected.to route("meow 3").to(:handle_meows) }
  it "meows 3 times given the number 3" do
    send_command("meow 3")
    expect(replies).to eq(["MEOW", "MEOW", "MEOW"])
  end
  it "meows 2 times given the number 2" do
    send_command("meow 2")
    expect(replies).to eq(["MEOW", "MEOW"])
  end
end
