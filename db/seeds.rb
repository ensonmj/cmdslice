Authentication.create!([
  {provider: "identity", uid: "1", user_id: 1}
])
Comment.create!([
  {body: "对于公网服务器，最好关闭password认证方式", commentable_id: 2, commentable_type: "Slice", user_id: 1}
])
Profile.create!([
  {name: nil, email: "ensonmj@163.com", website: nil, location: nil, user_id: 1}
])
Slice.create!([
  {title: "sync modified files", body: "```bash\r\ngit diff --name-only | xargs -I{} -r rsync -avR {} DEST_PATH\r\n```", note: "* find modified files\r\n* sync the files to DEST\r\n", user_id: 1},
  {title: "临时强制使用密码登陆", body: "```bash\r\nssh user@ip -o PreferredAuthentications=password\r\n```", note: "远端服务器同时允许 *publickey* 和 *password* 登陆时，如果临时无法使用 *publickey*，可使用此方法江湖救急", user_id: 1},
  {title: "mosh使用其他端口登陆", body: "```bash\r\nmosh --ssh=\"ssh -p xxxx\" user@ip\r\n```", note: "服务器修改了ssh的默认端口，xxxx表示修改后的端口", user_id: 1},
  {title: "gdb远程调试", body: "```bash\r\n[remote]$ gdbserver ip:port program core\r\n\r\n[local]$ gdb program\r\n[local]$ (gdb) target remote ip:port\r\n```", note: "* 两边gdb版本最好一致\r\n* ip为remote的地址，port任选", user_id: 1}
])
User.create!([
  {nickname: "devel", email: "ensonmj@163.com", auth_token: "ABtvCzf4fZuntlSCF7Rk4g"}
])
Identity.create!([
  {nickname: "devel", email: "ensonmj@163.com", password_digest: "$2a$10$P4oMtMKQgEW9mxr6IqOja.uZJz3Ptm7FOEEyCKJwzSg3y92Ikt1Ni", password_reset_token: nil, password_reset_sent_at: nil, user_id: 1, confirm_token: "xvMVHP44KPa1BUvftX3lkw", confirm_sent_at: "2014-11-04 09:00:30", confirmed_at: "2014-11-04 09:00:53"}
])
