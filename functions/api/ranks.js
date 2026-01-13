export async function onRequest(context) {
  // 'DB' matches the binding name in wrangler.toml
  const { DB } = context.env; 

  // Example: Getting all departments for a specific server
  const { results } = await DB.prepare(
    "SELECT * FROM departments WHERE server_id = ?"
  ).bind("19876493216946").all();

  return Response.json(results);
}