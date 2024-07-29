return {
	{ -- Integrated LLM
		"Chunt0/llm.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local system_prompt =
				"You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks"
			local helpful_prompt =
				"You are a helpful assistant. What I have sent are my notes so far. You are very curt, yet helpful."
			local en2ch_prompt =
				"You are a helpful assistant. Your goal is to translate text. You will not add anything to the text or output and commentary about the text you generate. Do not add any notes or warnings. Translate the following into chinese: "
			local en2ar_prompt =
				"You are a helpful assistant. Your goal is to translate text. You will not add anything to the text or output and commentary about the text you generate. Do not add any notes or warnings. Translate the following into arabic: "
			local llm = require("llm")

			local function groq_replace()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.groq.com/openai/v1/chat/completions",
					model = "llama3-70b-8192",
					api_key_name = "GROQ_API_KEY",
					system_prompt = system_prompt,
					replace = true,
					framework = "GROQ",
				}, llm.make_groq_spec_curl_args, llm.handle_groq_spec_data)
			end

			local function groq_help()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.groq.com/openai/v1/chat/completions",
					model = "llama-3.1-70b-versatile",
					api_key_name = "GROQ_API_KEY",
					system_prompt = helpful_prompt,
					replace = false,
					framework = "GROQ",
				}, llm.make_groq_spec_curl_args, llm.handle_groq_spec_data)
			end

			local function openai_replace()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.openai.com/v1/chat/completions",
					model = "gpt-4o",
					api_key_name = "OPENAI_API_KEY",
					system_prompt = system_prompt,
					replace = true,
					framework = "OPENAI",
				}, llm.make_openai_spec_curl_args, llm.handle_openai_spec_data)
			end

			local function openai_help()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.openai.com/v1/chat/completions",
					model = "gpt-4o",
					api_key_name = "OPENAI_API_KEY",
					system_prompt = en2ar_prompt,
					replace = false,
					framework = "OPENAI",
				}, llm.make_openai_spec_curl_args, llm.handle_openai_spec_data)
			end

			local function anthropic_help()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.anthropic.com/v1/messages",
					model = "claude-3-5-sonnet-20240620",
					api_key_name = "ANTHROPIC_API_KEY",
					system_prompt = helpful_prompt,
					replace = false,
					framework = "ANTHROPIC",
				}, llm.make_anthropic_spec_curl_args, llm.handle_anthropic_spec_data)
			end

			local function anthropic_replace()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.anthropic.com/v1/messages",
					model = "claude-3-5-sonnet-20240620",
					api_key_name = "ANTHROPIC_API_KEY",
					system_prompt = system_prompt,
					replace = true,
					framework = "ANTHROPIC",
				}, llm.make_anthropic_spec_curl_args, llm.handle_anthropic_spec_data)
			end

			local function ollama_help()
				llm.invoke_llm_and_stream_into_editor({
					url = "http://localhost:11434/api/generate",
					model = "llama3.1:70b-instruct-q2_k",
					system_prompt = helpful_prompt,
					replace = false,
					context = true,
					framework = "OLLAMA",
				}, llm.make_ollama_spec_curl_args, llm.handle_ollama_spec_data)
			end

			local function ollama_code()
				llm.invoke_llm_and_stream_into_editor({
					url = "http://localhost:11434/api/generate",
					model = "deepseek-coder:33b",
					system_prompt = system_prompt,
					replace = true,
					context = false,
					framework = "OLLAMA",
				}, llm.make_ollama_spec_curl_args, llm.handle_ollama_spec_data)
			end

			local function ollama_en2ch()
				llm.invoke_llm_and_stream_into_editor({
					url = "http://localhost:11434/api/generate",
					model = "yi:34b",
					system_prompt = en2ch_prompt,
					replace = false,
					context = false,
					framework = "OLLAMA",
				}, llm.make_ollama_spec_curl_args, llm.handle_ollama_spec_data)
			end

			vim.keymap.set({ "n", "v" }, "<C-s>", groq_help, { desc = "llm ollama help" })
			--vim.keymap.set({ "n", "v" }, "<C-b>", ollama_code, { desc = "llm ollama replace" })
			--vim.keymap.set({ "n", "v" }, "<leader>K", groq_help, { desc = "llm groq_help" })
			--vim.keymap.set({ "n", "v" }, "<leader>k", groq_replace, { desc = "llm groq_help" })
			--vim.keymap.set({ "n", "v" }, "<leader>L", openai_help, { desc = "llm openai_help" })
			--vim.keymap.set({ "n", "v" }, "<leader>l", openai_replace, { desc = "llm openai" })
			--vim.keymap.set({ "n", "v" }, "<leader>I", anthropic_help, { desc = "llm anthropic_help" })
			--vim.keymap.set({ "n", "v" }, "<leader>i", anthropic_replace, { desc = "llm anthropic" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
