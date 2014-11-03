require 'spec_helper'

describe "workers:start" do
  include_context "rake"

  before do
    Worker.stop
  end

  let(:output) { "All #{ENV['WORKERS']} workers started.\n" }

  it "prerequisites should include environment" do
    subject.prerequisites.should include("environment")
  end

  it "should run the rake task" do
    capture_stdout { subject.invoke }.should eq(output)
  end
end

describe "workers:stop" do
  include_context "rake"

  before do
    Worker.start
  end

  let(:output) { "All workers stopped.\n" }

  it "should run" do
    capture_stdout { subject.invoke }.should eq(output)
  end
end

describe "workers:monitor" do
  include_context "rake"

  before do
    Worker.stop
    @report = FactoryGirl.create(:missing_workers_report_with_admin_user)
  end

  after do
    Worker.stop
  end

  let(:message) { "Error monitoring workers, only 0 of #{ENV['WORKERS']} workers running. Workers restarted." }
  let(:output) { "#{message}\n#{ENV['WORKERS']} workers expected, #{ENV['WORKERS']} workers running.\n" }

  it "should run" do
    capture_stdout { subject.invoke }.should eq(output)

    Alert.count.should == 1
    alert = Alert.first
    alert.class_name.should eq("StandardError")
    alert.message.should eq(message)
  end
end
