module Jekyll
  module Tags
    class RenderPartialPageTag < RenderPartialTag
      def source(file, context)
        input = File.read(file, file_read_opts(context))

	first = input.index("---")
	if (first == nil) 
	  input
	end

	second = input.index("---", first + 1)
	if (second == nil)
	  input
	end

	input[(second + 3)..-1]
      end
    end
  end
end

Liquid::Template.register_tag('render_partial_page', Jekyll::Tags::RenderPartialPageTag)

