def simple_replace_in_file(filename, old_text, new_text):
    """
    在指定的文本文件中查找并替换特定内容。

    参数:
        filename (str): 要处理的文件路径。
        old_text (str): 需要被替换的旧文本。
        new_text (str): 替换后的新文本。
    """
    # 1. 读取文件
    with open(filename, 'r', encoding='utf-8') as file:
        content = file.read()

    # 2. 查找并替换内容
    # 使用字符串的 replace() 方法进行替换[2,5](@ref)
    new_content = content.replace(old_text, new_text)

    # 3. 保存文件（将修改后的内容写回原文件）
    with open(filename, 'w', encoding='utf-8') as file:
        file.write(new_content)

    print(f"替换完成。文件 '{filename}' 中所有的 '{old_text}' 已被替换为 '{new_text}'。")

# 使用示例
if __name__ == "__main__":
    # 替换以下变量为您的实际内容
    file_path = "example.txt"  # 目标文件路径
    old_string = "旧文本"      # 需要查找替换的旧文本
    new_string = "新文本"      # 替换后的新文本

    # 执行替换
    simple_replace_in_file("D:\桌面\化学\BIOMOD\文书最终版\labbook\LABBOOK规范版-副本.txt", "Obtain the electrophoretogram", "Obtain the electrophoretogram.​")
    simple_replace_in_file("D:\桌面\化学\BIOMOD\文书最终版\labbook\LABBOOK规范版-副本.txt", "25 mL 0.5 × TBE​ Buffer", "25 mL 0.5 × TBE​ Buffer.​")
    simple_replace_in_file("D:\桌面\化学\BIOMOD\文书最终版\labbook\LABBOOK规范版-副本.txt", "Obtain the Follow the table to prepare the solution mixture", "Follow the table to prepare the solution mixture.​")