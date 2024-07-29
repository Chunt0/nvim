return {
	{ -- Integrated LLM
		"Chunt0/llm.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local llm = require("llm")
			local prompts = require("prompts")
			local function groq_replace()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.groq.com/openai/v1/chat/completions",
					model = "llama3-70b-8192",
					api_key_name = "GROQ_API_KEY",
					system_prompt = prompts.system_prompt,
					replace = true,
					framework = "GROQ",
				}, llm.make_groq_spec_curl_args, llm.handle_groq_spec_data)
			end

			local function groq_help()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.groq.com/openai/v1/chat/completions",
					model = "llama-3.1-70b-versatile",
					api_key_name = "GROQ_API_KEY",
					system_prompt = prompts.helpful_prompt,
					replace = false,
					framework = "GROQ",
				}, llm.make_groq_spec_curl_args, llm.handle_groq_spec_data)
			end

			local function openai_replace()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.openai.com/v1/chat/completions",
					model = "gpt-4o",
					api_key_name = "OPENAI_API_KEY",
					system_prompt = prompts.system_prompt,
					replace = true,
					framework = "OPENAI",
				}, llm.make_openai_spec_curl_args, llm.handle_openai_spec_data)
			end

			local function openai_help()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.openai.com/v1/chat/completions",
					model = "gpt-4o",
					api_key_name = "OPENAI_API_KEY",
					system_prompt = prompts.en2ar_prompt,
					replace = false,
					framework = "OPENAI",
				}, llm.make_openai_spec_curl_args, llm.handle_openai_spec_data)
			end

			local function anthropic_help()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.anthropic.com/v1/messages",
					model = "claude-3-5-sonnet-20240620",
					api_key_name = "ANTHROPIC_API_KEY",
					system_prompt = prompts.helpful_prompt,
					replace = false,
					framework = "ANTHROPIC",
				}, llm.make_anthropic_spec_curl_args, llm.handle_anthropic_spec_data)
			end

			local function anthropic_replace()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.anthropic.com/v1/messages",
					model = "claude-3-5-sonnet-20240620",
					api_key_name = "ANTHROPIC_API_KEY",
					system_prompt = prompts.system_prompt,
					replace = true,
					framework = "ANTHROPIC",
				}, llm.make_anthropic_spec_curl_args, llm.handle_anthropic_spec_data)
			end

			local function ollama_help()
				llm.invoke_llm_and_stream_into_editor({
					url = "http://localhost:11434/api/generate",
					model = "llama3.1:70b-instruct-q2_k",
					system_prompt = prompts.helpful_prompt,
					replace = false,
					context = true,
					framework = "OLLAMA",
				}, llm.make_ollama_spec_curl_args, llm.handle_ollama_spec_data)
			end

			local function ollama_code()
				llm.invoke_llm_and_stream_into_editor({
					url = "http://localhost:11434/api/generate",
					model = "deepseek-coder:33b",
					system_prompt = prompts.system_prompt,
					replace = true,
					context = false,
					framework = "OLLAMA",
				}, llm.make_ollama_spec_curl_args, llm.handle_ollama_spec_data)
			end

			local function ollama_en2ch()
				llm.invoke_llm_and_stream_into_editor({
					url = "http://localhost:11434/api/generate",
					model = "yi:34b",
					system_prompt = prompts.en2ch_prompt,
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
