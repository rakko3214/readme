module ApplicationHelper
  def default_meta_tags
      {
        title: "献立作成アプリ",
        description: "レシピを登録し、自作の献立を作成することができます",
        keywords: "レシピ,献立",
        reverse: true,
        canonical: request.original_url,
        og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: request.original_url,
        image: image_url("recipe_placeholder.png"),
        local: "ja-JP"
        },
        twitter: {
          image: image_url("recipe_placeholder.png"),
          site: "@", 
        }
      }
    end
end
