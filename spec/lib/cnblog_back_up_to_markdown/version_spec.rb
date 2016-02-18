require 'spec_helper'

RSpec.describe :version do
  it 'change version equal system' do
    expect(CnblogBackUpToMarkdown::VERSION).to eq '0.1.1'
  end
end
