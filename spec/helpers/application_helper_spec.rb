require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#page_title" do

    context "as admin" do
      before do
        assign(:title, "title")
        controller.stub(:controller_path).and_return("admin/articles")
      end

      subject { helper.page_title }
      it { is_expected.to eq("CrimethInc. Admin : title") }
    end

    context "with title" do
      before { assign(:title, "title") }

      subject { helper.page_title }

      it { is_expected.to eq("CrimethInc. : title")}
    end

    context "without title" do
      subject { helper.page_title }

      it { is_expected.to eq("CrimethInc.")}
    end
  end

  describe "#largest_touch_icon_url" do
    subject { helper.largest_touch_icon_url }

    it { is_expected.to match("icons/icon-600x600") }
  end
end
